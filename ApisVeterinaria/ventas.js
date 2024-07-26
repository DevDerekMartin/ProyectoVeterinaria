const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const cors = require('cors');
const db = require('./db');

const app = express();
const port = 3002;

app.use(bodyParser.json());
app.use(cors());

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database');
});

// Crear una nueva venta junto con los detalles de la tarjeta y los productos vendidos
app.post('/ventas', (req, res) => {
  const { tarjeta, venta, productos } = req.body;

  db.beginTransaction((err) => {
    if (err) {
      return res.status(500).json({ error: 'Error starting transaction' });
    }

    const tarjetaQuery = `INSERT INTO tarjeta_cliente (numero_tarjeta, nombre_titular, vencimiento, codigo_seguridad) VALUES (?, ?, ?, ?)`;
    const tarjetaValues = [tarjeta.numero, tarjeta.nombre_titular, tarjeta.fecha_expiracion, tarjeta.cvv];

    db.query(tarjetaQuery, tarjetaValues, (err, result) => {
      if (err) {
        return db.rollback(() => {
          res.status(500).json({ error: 'Error inserting card' });
        });
      }

      const tarjetaId = result.insertId;

      const ventaQuery = `INSERT INTO ventas (fecha_de_compra, idtarjeta_cliente, total) VALUES (NOW(), ?, ?)`;
      const ventaValues = [tarjetaId, venta.total];

      db.query(ventaQuery, ventaValues, (err, result) => {
        if (err) {
          return db.rollback(() => {
            res.status(500).json({ error: 'Error inserting sale' });
          });
        }

        const ventaId = result.insertId;

        const productosQuery = `INSERT INTO Producto_Ventas (id_producto, id_venta, cantidad) VALUES ?`;
        const productosValues = productos.map((producto) => [producto.producto_id, ventaId, producto.cantidad]);

        db.query(productosQuery, [productosValues], (err, result) => {
          if (err) {
            return db.rollback(() => {
              res.status(500).json({ error: 'Error inserting sale products' });
            });
          }

          db.commit((err) => {
            if (err) {
              return db.rollback(() => {
                res.status(500).json({ error: 'Error committing transaction' });
              });
            }

            res.status(201).json({ message: 'Sale created successfully' });
          });
        });
      });
    });
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
