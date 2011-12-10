(function ($) {   
    $.fn.extend({   
        rollList: function (option) {   
            option = $.extend({   
                direction: "up",/*up向上滚动，其他向下滚动*/  
                step: 1,    /*滚动步长*/  
                time: 50    /*time调整滚动的速度，数值越大，速度越慢*/  
            }, option);   
            var step_coe, scroll_coe, score_coe;   
            if (option.direction == "up") {    
                step_coe = 1;   
                scroll_coe = 1;   
                score_coe = 1;   
            } else {   
                step_coe = -1;   
                scroll_coe = -1;   
                score_coe = 0;   
            }   
            return this.each(function () {   
                var $this = $(this);   
                var _this = this;   
                var itemHeight;   
                var temp = $("<DIV> </DIV>");   
                $this.css("overflow", "hidden").children().appendTo(temp);   
                $this.append(temp.clone(true)).append(temp);   
                itemHeight = $this.children();   
                itemHeight = itemHeight.eq(1).offset().top - itemHeight.eq(0).offset().top;   
                while ($this.children(":last").offset().top - $this.offset().top <= $this.height())   
                    $this.append(temp.clone(true));   
                var roll;   
                this.scrollTop = itemHeight * (1 - score_coe);   
                roll = function () {   
                    temp = setInterval(function () {   
                        if (_this.scrollTop * scroll_coe >= itemHeight * score_coe) {   
                            _this.scrollTop = (_this.scrollTop - itemHeight) * scroll_coe;   
                        }   
                        _this.scrollTop += option.step * step_coe;   
                    }, option.time);   
                }   
                $this.hover(function () {   
                    clearInterval(temp);   
                }, function () {   
                    roll();   
                });   
                roll();   
            });   
        }   
    })   
} (jQuery));  