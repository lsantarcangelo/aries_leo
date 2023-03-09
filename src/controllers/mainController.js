const mainController={
    index : (req, res) => {
        res.render('../src/views/index');
    },

    contact: (req, res) => {
        res.render('../src/views/contact');
    },

    about: (req, res) => {
        res.render('../src/views/about')
    }
}
module.exports = mainController