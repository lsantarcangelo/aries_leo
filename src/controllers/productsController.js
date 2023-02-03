const fs = require('fs');
const path = require('path');
const productsPath = path.join(__dirname, '../data/productsData.json')
const products = JSON.parse(fs.readFileSync(productsPath, 'utf-8'));
const db = require('../../database/models');



const man = products.filter(function(product){
	return product.category == 'man'
})

const woman = products.filter(function(product){
	return product.category == 'woman'
})

const kids = products.filter(function(product){
	return product.category == 'kids'
})

const accesories = products.filter(function(product){
	return product.category == 'accesories'
})



const productsController = {
    //Listado de todos los productos
    list: (req, res) => {
        db.Product.findAll()
            .then(function(products) {
                res.render('./products/productList', {products:products});
            })		
    },

    //Detalle de un producto//
	detail: (req, res) => {
		let product = products.find(element=>element.id == req.params.id)
		res.render('./products/productDetail', {product});
	},
    
    //Creacion de nuevo producto
    create: (req, res) => {
        let findCategories = db.Category.findAll();
        let findColors = db.Color.findAll();
        let findSizes = db.Size.findAll();
        Promise.all([findCategories, findColors, findSizes])
            .then(function([categories, colors, sizes]) {
                return res.render('./products/productCreateForm', {
                    categories:categories,
                    colors:colors,
                    sizes:sizes
                });
            })
        // db.Category.findAll()
        //     .then(function(categories) {
        //         return res.render('./products/productCreateForm', {categories:categories});
        //     })
    },

    store: (req, res) => {
        db.Product.create({
            'name': req.body.name,
            'description': req.body.description,
            'product_img': req.file.filename,
            'category_id': req.body.category,
            'color_id': req.body.color,
            'size_id': req.body.size,
            'stock': req.body.stock,
            'price': req.body.price,
            'is_active': 1
        })
        res.redirect('/products');
    },

    edit: (req, res) => {
        let product = products.find(element => element.id == req.params.id);
        res.render('./products/productEditForm', {product});
    },

    update: (req, res) => {
        let productToUpdate = {
            'id': req.params.id,
            'name': req.body.name,
            'description': req.body.description,
            'image': req.file.filename,
            'category': req.body.category,
            'color': req.body.color,
            'size': req.body.size,
            'price': '1200',
        };

        let productUpdated = products.map(element => {
            if (element.id == productToUpdate.id) {
                return element = productToUpdate;
            } else {
                return element;
            }
        });

        fs.writeFileSync(productsPath, JSON.stringify(productUpdated, null, ' '));
		res.redirect('/');
    },

    //Eliminar Producto
    destroy : (req, res) => {
    let productId = req.params.id;

    let productDelete=products.filter(product=>product.id != productId)

    fs.writeFileSync(productsPath, JSON.stringify(productDelete, null,'\t'));

    res.redirect('/products')
}
}

module.exports= productsController