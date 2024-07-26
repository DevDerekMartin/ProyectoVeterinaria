// server.js
const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');

const app = express();
const port = 3000;
const cors = require('cors');

app.use(bodyParser.json());
app.use(cors());

// Crear un nuevo producto
app.post('/productos', (req, res) => {
  const {
    codigo, nombre, marca, categoria_id, ingredientes, asociacion, formulacion, 
    presentacion_comercial_M, dosis, indicaciones, cantidad, proveedor_id, 
    precio_unitario_E, precio_unitario_P, descripcion, imagen 
  } = req.body;
  const query = `
    INSERT INTO producto (codigo, nombre, marca, categoria_id, ingredientes, asociacion, 
    formulacion, presentacion_comercial_M, dosis, indicaciones, cantidad, proveedor_id, 
    precio_unitario_E, precio_unitario_P, descripcion, imagen) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [
    codigo, nombre, marca, categoria_id, ingredientes, asociacion, formulacion, 
    presentacion_comercial_M, dosis, indicaciones, cantidad, proveedor_id, 
    precio_unitario_E, precio_unitario_P, descripcion, imagen
  ];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error inserting product:', err);
      res.status(500).send('Error inserting product');
    } else {
      res.status(201).send('Product created successfully');
    }
  });
});

// Obtener todos los productos
app.get('/productos', (req, res) => {
  const query = 'SELECT * FROM producto';

  db.query(query, (err, results) => {
    if (err) {
      console.error('Error fetching products:', err);
      res.status(500).send('Error fetching products');
    } else {
      res.status(200).json(results);
    }
  });
});

// Obtener un producto por ID
app.get('/productos/:id', (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM producto WHERE id = ?';

  db.query(query, [id], (err, result) => {
    if (err) {
      console.error('Error fetching product:', err);
      res.status(500).send('Error fetching product');
    } else if (result.length === 0) {
      res.status(404).send('Product not found');
    } else {
      res.status(200).json(result[0]);
    }
  });
});

// Obtener productos por categoría específica
const getProductsByCategory = (categoryName) => (req, res) => {
  const query = `
    SELECT p.* 
    FROM producto p
    JOIN categoria c ON p.categoria_id = c.id
    WHERE c.nombre = ?`;

  db.query(query, [categoryName], (err, results) => {
    if (err) {
      console.error(`Error fetching ${categoryName} products:`, err);
      res.status(500).send(`Error fetching ${categoryName} products`);
    } else {
      res.status(200).json(results);
    }
  });
};

// Definir rutas para categorías específicas
app.get('/productos/categoria/medicamento', getProductsByCategory('Medicamento'));
app.get('/productos/categoria/accesorio', getProductsByCategory('Accesorio'));
app.get('/productos/categoria/higiene', getProductsByCategory('Higiene'));
app.get('/productos/categoria/alimento', getProductsByCategory('Alimento'));

// Actualizar un producto por ID
app.put('/productos/:id', (req, res) => {
  const { id } = req.params;
  const {
    codigo, nombre, marca, categoria_id, ingredientes, asociacion, formulacion, 
    presentacion_comercial_M, dosis, indicaciones, cantidad, proveedor_id, 
    precio_unitario_E, precio_unitario_P, descripcion, imagen 
  } = req.body;
  const query = `
    UPDATE producto SET codigo = ?, nombre = ?, marca = ?, categoria_id = ?, ingredientes = ?, 
    asociacion = ?, formulacion = ?, presentacion_comercial_M = ?, dosis = ?, indicaciones = ?, 
    cantidad = ?, proveedor_id = ?, precio_unitario_E = ?, precio_unitario_P = ?, descripcion = ?, 
    imagen = ? WHERE id = ?`;
  const values = [
    codigo, nombre, marca, categoria_id, ingredientes, asociacion, formulacion, 
    presentacion_comercial_M, dosis, indicaciones, cantidad, proveedor_id, 
    precio_unitario_E, precio_unitario_P, descripcion, imagen, id
  ];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error updating product:', err);
      res.status(500).send('Error updating product');
    } else if (result.affectedRows === 0) {
      res.status(404).send('Product not found');
    } else {
      res.status(200).send('Product updated successfully');
    }
  });
});

// Eliminar un producto por ID
app.delete('/productos/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM producto WHERE id = ?';

  db.query(query, [id], (err, result) => {
    if (err) {
      console.error('Error deleting product:', err);
      res.status(500).send('Error deleting product');
    } else if (result.affectedRows === 0) {
      res.status(404).send('Product not found');
    } else {
      res.status(200).send('Product deleted successfully');
    }
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
