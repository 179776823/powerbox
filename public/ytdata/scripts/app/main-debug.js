define("app/main-debug", [], function(require, exports, module) {
    //初始化layout
    seajs.use(JOL.root + "/layout/main", function(page) {
        Backbone.history.start();
    });
});
