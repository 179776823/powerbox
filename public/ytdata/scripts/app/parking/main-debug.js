define("app/parking/main-debug", [ "../common/dialog-debug", "../common/utils/ajaxService-debug", "../common/message-debug", "../common/getBrowser-debug", "../common/utils/encodeHtml-debug", "./handlers/addDevice-debug", "./handlers/saveDevice-debug" ], function(require, exports, module) {
    var View = JOL.view.extend({
        type: "parking",
        template: "parking.main",
        events: {
            "contextmenu .listbox": "controlRclick",
            "click [action=addDevice]": "addDevice",
            "mouseleave #rightmenu ul": "hidemenu",
            "click #park_device_list_userrows tr": "check",
            "click .event_list_userrows tr": "checkEvent"
        },
        initialize: function() {
            var self = this, page = self.model.get("page"), AjaxModel = JOL.model.extend({
                urlRoot: "/api/device/getList"
            }), Dialog = require("../common/dialog-debug");
            self.ajaxModel = new AjaxModel();
            self.selectedDevice = null;
            self.ajaxService = require("../common/utils/ajaxService-debug");
            self.message = require("../common/message-debug");
            self.getBrowser = require("../common/getBrowser-debug");
            self.encodeHtml = require("../common/utils/encodeHtml-debug");
            self.addDevice = require("./handlers/addDevice-debug");
            self.addParking = new Dialog({
                type: "parking",
                template: "parking._addparking",
                parent: self,
                width: 600,
                events: {
                    "click [name=btmSave]": require("./handlers/saveDevice-debug")
                }
            });
            self.deleteParking = new Dialog({
                type: "parking",
                template: "parking._deletedlg",
                parent: self,
                width: 600,
                events: {
                    "click [name=btnYes]": "delDevice"
                },
                delDevice: function(e) {
                    var Ajax = JOL.model.extend({
                        urlRoot: "./api/import/delDevice"
                    }), dId = this.model.get("deviceId"), self = this;
                    new Ajax().save({
                        deviceId: dId,
                        type: "parking"
                    }, {
                        type: "post",
                        success: function(model, res) {
                            var dId = model.attributes.deviceId;
                            if (res.code === 200) {
                                _.each(page.deviceList, function(device, index, arr) {
                                    if (device.deviceId === dId) {
                                        arr.splice(index, 1);
                                    }
                                });
                                self.parent.render();
                                self.close();
                                return;
                            } else {
                                self.parent.message.open("add error", "danger").show();
                            }
                        }
                    });
                }
            });
            self.hidemenu = function(e) {
                var target = $(e.currentTarget);
                target.parent().css("display", "none");
            };
            self.controlRclick = function(e) {
                e.preventDefault();
                var target = $(e.currentTarget);
                if (!!target.data("ismainbox")) {
                    self.$el.find("#rightmenu").css({
                        display: "block",
                        left: e.clientX - 10 + "px",
                        top: e.clientY - 70 + "px"
                    });
                }
            };
            self.check = function(e) {
                var target = $(e.currentTarget), page = self.model.get("page"), dId, Ajax = JOL.model.extend({
                    urlRoot: "./api/device/getEventList"
                });
                if (target.hasClass("selected")) {
                    target.removeClass("selected");
                    self.selectedDevice = null;
                    page.selectedDevice = null;
                    return;
                } else {
                    self.$el.find("#park_device_list_userrows tr").removeClass("selected");
                    target.addClass("selected");
                    dId = target.attr("args");
                    _.each(page.deviceList, function(device) {
                        if (device.deviceId.toString() === dId) {
                            self.selectedDevice = device;
                            page.selectedDevice = device;
                            return;
                        }
                    });
                }
                if (!!self.selectedDevice) {
                    new Ajax().save({
                        type: "parking",
                        deviceId: self.selectedDevice.deviceId
                    }, {
                        type: "post",
                        success: function(model, res) {
                            if (res.code === 200) {
                                page.eventList = res.list;
                                self.$el.find(".parking-event-list").run("parking._eventlist", page);
                                self.$el.find(".parking-device-info").run("parking._deviceinfo", page);
                            } else {
                                self.message.open("add error", "danger").show();
                            }
                        }
                    });
                } else {
                    self.$el.find(".parking-event-list").run("parking._eventlist", page);
                    self.$el.find(".parking-device-info").run("parking._deviceinfo", page);
                }
            };
            self.checkEvent = function(e) {
                var target = $(e.currentTarget), page = self.model.get("page"), eId;
                if (target.hasClass("selected")) {
                    target.removeClass("selected");
                    self.selectedEvent = null;
                    page.selectedEvent = null;
                    return;
                } else {
                    self.$el.find(".event_list_userrows tr").removeClass("selected");
                    target.addClass("selected");
                    eId = target.attr("args");
                    _.each(page.eventList, function(event) {
                        if (event.id.toString() === eId) {
                            self.selectedEvent = event;
                            page.selectedEvent = event;
                            self.$el.find(".image-template").run("parking._imageTemplate", page);
                            return;
                        }
                    });
                }
            };
            self.ajaxModel = new AjaxModel().on("sync", function(model, res) {
                if (!!res.code && res.code !== 200) {
                    return;
                }
                page.deviceList = res.list;
                self.render();
                return false;
            });
            self.ajaxModel.fetch({
                type: "get",
                data: {
                    type: "parking"
                },
                error: function() {
                    self.errordlg.open();
                    return false;
                }
            });
        }
    });
    module.exports = new View();
});

define("app/common/dialog-debug", [], function(require, exports, module) {
    var $dialog = $(".dialog");
    var $content = $(".dlg-wrapper");
    var option;
    var dialog = Backbone.View.extend({
        el: ".dlg-wrapper",
        constructor: function(opts) {
            this.initialize(opts);
            this.undelegateEvents();
        },
        initialize: function(opts) {
            option = opts;
            opts.events = $.extend(opts.events, dialog.prototype.events);
            $.extend(this, opts);
            this.draggable = typeof opts.draggable === "undefined" ? true : opts.draggable;
            this.overlay = typeof opts.overlay === "undefined" ? false : opts.overlay;
            this.pos = typeof opts.pos === "undefined" ? false : opts.pos;
            this.$el = $(this.el);
            this.$elp = $(this.elp);
            if (this.path) {
                this.model = new JOL.model({
                    page: pageModel[this.type][this.path]
                });
            } else {
                this.model = new JOL.model({
                    page: pageModel[this.type]
                });
            }
            opts.theme && this.$el.addClass(opts.theme);
            this.theme = opts.theme;
            typeof opts.init === "function" && opts.init.apply(this);
        },
        render: function() {
            var self = this;
            if (typeof this.beforerender === "function") {
                $.when(this.beforerender(self)).done(function() {
                    self.$el.run(self.template, self.model.toJSON());
                });
            } else {
                this.$el.run(this.template, this.model.toJSON());
            }
        },
        open: function(opts, e) {
            if (opts && opts.model !== "undefined") {
                this.model = new JOL.model(opts.model);
                if (opts.model) {
                    this.changeparam(opts.model);
                }
            }
            if (this.theme !== undefined) {
                this.$el.attr("class", "dlg-wrapper hide " + this.theme);
                $dialog.attr("class", "dialog hide " + this.theme + "-o");
            } else {
                this.$el.attr("class", "dlg-wrapper hide ");
                // if no error can remove
                opts && opts.theme && this.$el.attr("class", "dlg-wrapper hide " + opts.theme) && $dialog.attr("class", "dialog hide " + opts.theme + "-o");
                this.model.get("theme") && this.$el.attr("class", "dlg-wrapper hide " + this.model.get("theme")) && $dialog.attr("class", "dialog hide " + this.model.get("theme") + "-o");
            }
            this.render();
            this.delegateEvents();
            if (!this.draggable) {
                $(".dlg-wrapper").undelegate("mousedown");
                $(window).unbind("scroll");
            }
            this.afterrender && this.afterrender();
            this._adjustPosition(e);
            this._addMoveListener();
            $dialog.show();
            $content.show();
            if (opts && opts.callback) {
                this.callback = opts.callback;
                if (this.execute) {
                    opts.callback();
                }
            }
        },
        changeparam: function(model) {
            this.width = model.width ? model.width : this.width;
            this.height = model.height ? model.height : this.height;
            this.template = model.template ? model.template : this.template;
        },
        events: {
            "click .icon-close-blue": "close",
            "click .cancelBtn": "close",
            "click .doc-btn-can": "close",
            "click .cancel": "close",
            "click .closedlg": "close"
        }
    });
    dialog.prototype.close = function(e) {
        this.undelegateEvents();
        $dialog.hide();
        $content.hide();
        $content.html("");
        this.afterclose && this.afterclose();
        return false;
    };
    dialog.prototype._adjustPosition = function(e) {
        var clientWidth = $(window).width();
        var clientHeight = $(window).height();
        var scrollTop = $(window).scrollTop();
        var bodyHeight = $("body").height();
        var height;
        var precentWidth;
        // var width = this.$el.width();
        var left, top;
        this.$el.height("auto");
        height = this.$el.height();
        // if (width) {
        //   $content.width(width);
        // }
        // if (height) {
        //   $content.height(height);
        // }
        // width = $content.width();
        if (this.width.toString().indexOf("%") > -1) {
            precentWidth = clientWidth * parseInt(this.width, 10) / 100;
            if (this.minWidth && this.minWidth < precentWidth) {
                left = (clientWidth - precentWidth) * .5;
            } else {
                left = (clientWidth - this.minWidth) * .5;
            }
        } else {
            left = (clientWidth - this.width) * .5;
        }
        // left = (clientWidth - this.width) * 0.5;
        top = height ? (clientHeight - height) * .4 : (clientHeight - height) * .2;
        if (clientHeight < height) {
            top = 40;
        }
        if (this.pos) {
            var $target = $(e.target), position = $target.offset();
            left = position.left;
            top = position.top + 21;
            this.$el.find(".tab-container").css({
                height: height - 20 + "px"
            });
        }
        $dialog.css({
            width: clientWidth + "px",
            height: bodyHeight + "px"
        });
        if (this.overlay) {
            $content.css({
                left: left + "px",
                top: top + scrollTop + "px"
            });
            $dialog.addClass("noticeoverlay");
        } else {
            $content.css({
                left: left + "px",
                top: top + scrollTop + "px"
            });
            $dialog.removeClass("noticeoverlay");
        }
        if (this.width) {
            $content.width(this.width);
            this.minWidth ? $content.css("min-width", this.minWidth + "px") : $content.css("min-width", "0px");
        }
        // if (height) {
        //   $content.height(height);
        // }
        return this;
    };
    dialog.prototype._addMoveListener = function() {
        var self = this, potTimeout;
        if (!this.pos) {
            $(window).bind("scroll", function(event) {
                clearTimeout(potTimeout);
                potTimeout = setTimeout(function() {
                    self._adjustPosition();
                }, 200);
            });
            $(window).bind("resize", function(event) {
                clearTimeout(potTimeout);
                potTimeout = setTimeout(function() {
                    self._adjustPosition();
                }, 200);
            });
        }
        if (this.draggable) {
            // Add drag event listener
            var startLeft, startTop, startX, startY, offset, deltaX, deltaY, left, top;
            $(".dlg-wrapper").undelegate("mousedown").delegate(".dlg-header", "mousedown", function(event) {
                offset = $(this).offset();
                startLeft = offset.left;
                startTop = offset.top;
                startX = event.clientX;
                startY = event.clientY;
                $("window,body").bind("mousemove", function(event) {
                    deltaX = event.clientX - startX, deltaY = event.clientY - startY, left = startLeft + deltaX, 
                    top = startTop + deltaY;
                    $content.css("left", left + "px").css("top", top + "px");
                }).bind("mouseup", function(event) {
                    $("window,body").unbind("mousemove");
                });
            });
        }
        return this;
    };
    module.exports = dialog;
});

define("app/common/utils/ajaxService-debug", [], function(require, exports, module) {
    module.exports = function(url, data, onSuccess, type) {
        $.ajax({
            type: !type ? "get" : "post",
            url: url,
            data: data,
            contentType: "application/json;charset=utf-8",
            success: function(data, textStatus) {
                if (!!data) {
                    try {
                        onSuccess(JSON.parse(data));
                    } catch (error) {
                        onSuccess(data);
                    }
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {}
        });
    };
});

define("app/common/message-debug", [], function(require, exports, module) {
    var View = JOL.view.extend({
        template: "common.message",
        events: {
            "click .close": "close"
        },
        initialize: function() {
            this.$el = $("body > .message");
            this.visible = false;
        },
        open: function(message, type) {
            this.model = new JOL.model({
                message: message,
                type: type
            });
            this.getBrowser = function() {
                var userAgent = navigator.userAgent, rMsie = /(msie\s|trident.*rv:)([\w.]+)/, rFirefox = /(firefox)\/([\w.]+)/, rOpera = /(opera).+version\/([\w.]+)/, rChrome = /(chrome)\/([\w.]+)/, rSafari = /version\/([\w.]+).*(safari)/, ua = userAgent.toLowerCase(), match = "";
                function uaMatch(ua) {
                    match = rMsie.exec(ua);
                    if (match !== null) {
                        return {
                            name: "IE",
                            version: match[2] || "0"
                        };
                    }
                    match = rFirefox.exec(ua);
                    if (match !== null) {
                        return {
                            name: match[1] || "",
                            version: match[2] || "0"
                        };
                    }
                    match = rOpera.exec(ua);
                    if (match !== null) {
                        return {
                            name: match[1] || "",
                            version: match[2] || "0"
                        };
                    }
                    match = rChrome.exec(ua);
                    if (match !== null) {
                        return {
                            name: match[1] || "",
                            version: match[2] || "0"
                        };
                    }
                    match = rSafari.exec(ua);
                    if (match !== null) {
                        return {
                            name: match[2] || "",
                            version: match[1] || "0"
                        };
                    }
                    if (!match) {
                        return {
                            name: "",
                            version: "0"
                        };
                    }
                }
                return uaMatch(ua);
            };
            return this;
        },
        scroll: function() {
            $("body > .message").css({
                top: $(window).scrollTop()
            });
        },
        close: function() {
            $(window).unbind("scroll", this.scroll);
            if (this.visible) {
                this.$el.slideUp("slow");
                this.visible = false;
            }
        },
        show: function(time, callback) {
            if (this.visible) {
                this.timeId && clearTimeout(this.timeId);
            }
            var self = this;
            this.render();
            if (this.getBrowser().version === "6.0") {
                this.$el.css({
                    position: "absolute",
                    top: $(window).scrollTop()
                });
                $(window).bind("scroll", this.scroll);
            }
            this.$el.slideDown("slow");
            this.visible = true;
            if (time) {
                this.timeId = setTimeout(function() {
                    self.close(callback);
                }, time);
            } else {
                this.timeId = setTimeout(function() {
                    self.close();
                }, 3e3);
            }
        },
        afterRender: function() {}
    });
    module.exports = new View();
});

define("app/common/getBrowser-debug", [], function(require, exports, module) {
    module.exports = function() {
        var userAgent = navigator.userAgent, rMsie = /(msie\s|trident.*rv:)([\w.]+)/, rFirefox = /(firefox)\/([\w.]+)/, rOpera = /(opera).+version\/([\w.]+)/, rChrome = /(chrome)\/([\w.]+)/, rSafari = /version\/([\w.]+).*(safari)/, ua = userAgent.toLowerCase(), match = "";
        function uaMatch(ua) {
            match = rMsie.exec(ua);
            if (match !== null) {
                return {
                    name: "IE",
                    version: match[2] || "0"
                };
            }
            match = rFirefox.exec(ua);
            if (match !== null) {
                return {
                    name: match[1] || "",
                    version: match[2] || "0"
                };
            }
            match = rOpera.exec(ua);
            if (match !== null) {
                return {
                    name: match[1] || "",
                    version: match[2] || "0"
                };
            }
            match = rChrome.exec(ua);
            if (match !== null) {
                return {
                    name: match[1] || "",
                    version: match[2] || "0"
                };
            }
            match = rSafari.exec(ua);
            if (match !== null) {
                return {
                    name: match[2] || "",
                    version: match[1] || "0"
                };
            }
            if (match !== null) {
                return {
                    name: "",
                    version: "0"
                };
            }
        }
        return uaMatch(ua);
    };
});

define("app/common/utils/encodeHtml-debug", [], function(require, exports, module) {
    var entity = {
        "<": "&lt;",
        ">": "&gt;"
    };
    module.exports = function(text) {
        if (_.isArray(text)) {
            _.each(text, function(txt, index) {
                txt = txt.replace(/(<br[^>]*>)/g, "@_@");
                txt = txt.replace(/[<>]/g, function(a) {
                    text[index] = txt;
                });
                text[index] = txt.replace(/@_@/g, "<br />");
            });
            return text;
        } else {
            text = text.replace(/(<br[^>]*>)/g, "@_@");
            text = text.replace(/[<>]/g, function(a) {
                return entity[a];
            });
            return text.replace(/@_@/g, "<br />");
        }
    };
});

define("app/parking/handlers/addDevice-debug", [], function(require, exports, module) {
    module.exports = function(e) {
        var self = this, // page = this.model.get('page'),
        type = $(e.currentTarget).attr("args");
        if (type === "add") {
            self.addParking.open();
            return;
        }
        if (type === "edit") {
            if (self.selectedDevice) {
                self.addParking.open({
                    model: self.selectedDevice
                });
            } else {
                alert("未选中可编辑的设备");
            }
        }
        if (type === "del") {
            if (self.selectedDevice) {
                self.deleteParking.open({
                    model: self.selectedDevice
                });
            } else {
                alert("未选中可删除的设备");
            }
        }
        $(e.currentTarget).parents("#rightmenu").css("display", "none");
        return;
    };
});

define("app/parking/handlers/saveDevice-debug", [], function(require, exports, module) {
    module.exports = function(e) {
        var self = this, page = self.parent.model.get("page"), AjaxModel = JOL.model.extend({
            urlRoot: "./api/import/addDevice"
        }), params;
        params = {
            deviceCode: self.$el.find("[name=txtDevcieId]").val(),
            address: self.$el.find("[name=txtAddress]").val(),
            parkName: self.$el.find("[name=txtParkName]").val(),
            parkNum: self.$el.find("[name=TxtCarCount]").val(),
            note: self.$el.find("[name=txtNote]").val(),
            lon: self.$el.find("[name=txtLon]").val(),
            lat: self.$el.find("[name=txtLat]").val(),
            alt: self.$el.find("[name=txtAlt]").val(),
            floor: self.$el.find("[name=txtFloor]").val(),
            gisType: self.$el.find("[name=pmuAxisType]").val(),
            isHidden: self.$el.find("[name=chkMask]").prop("checked") ? 1 : 0,
            isCloudDevice: self.$el.find("[name=chkCloud]").prop("checked") ? 1 : 0,
            type: "parking"
        };
        if (self.model.get("deviceId")) {
            AjaxModel = JOL.model.extend({
                urlRoot: "./api/import/updateDevice"
            });
            params.deviceId = self.model.get("deviceId");
        }
        new AjaxModel().save(params, {
            type: "post",
            success: function(model, res) {
                if (res.code === 200) {
                    if (!!params.deviceId) {
                        _.each(page.deviceList, function(device) {
                            if (device.deviceId === params.deviceId) {
                                $.extend(device, params);
                                return;
                            }
                        });
                        self.parent.render();
                        self.close();
                        return;
                    }
                    params.deviceId = res.result.deviceId;
                    page.deviceList.push(params);
                    self.parent.render();
                    self.close();
                } else {
                    self.parent.message.open("add error", "danger").show();
                }
            }
        });
        return self;
    };
});
