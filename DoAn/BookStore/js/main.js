$(document).ready(function() {
    'use strict';
    toggleMenu();
    toggleCategories();
    carousel();
    adminManagerBar('.manager');
    tabManager('.manager');
    addBookBtn();
    editBtn();
    removeBtn();
})
// toggle button
function toggleMenu() {
    $('#btn-menu').on('click', function() {
        $('.menu').toggleClass('show');
    });
}
// button categories
function toggleCategories() {
    $('#btn-categories').on('click', function() {
        $('.menu-categories').slideToggle(300);
    });
}
// slick carousel
function carousel() {
    var n = 3;
    for (var i = 1; i <= n; i++) {
        let containerNode = $('<div></div>');
        containerNode.addClass('slick');
        let node = $('<div></div>');
        containerNode.append(node);
        node.addClass('carousel');
        node.css('background-image', 'url("./img/carousel-' + i + '.jpg")');
        $('.section-hero').append(containerNode);
    }
    $('.section-hero').slick({
        infinite: true,
        arrows: false,
        dots: true,
        autoplay: true,
        autoplaySpeed: 2000,
        swipe: true
    });
}

function adminManagerBar(el) {
    function initNewsCarousel() {
        if ($(window).width() < 768) {
            if (!$(el).hasClass('slick-initialized')) {
                $(el).slick({
                    dots: false,
                    arrows: true,
                    mobileFirst: true,
                    prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-chevron-left"></i></button>',
                    nextArrow: '<button type="button" class="slick-next"><i class="fa fa-chevron-right"></i></button>',
                    responsive: [{
                        breakpoint: 767,
                        settings: "unslick"
                    }]
                });
                $(el).addClass('slick-initialized');
            }
        }
    }
    initNewsCarousel();
    $(window).resize(function() {
        initNewsCarousel();
    });
}

function tabManager(el) {
    $(el).on('click', '.manager-item a', function(e) {
        e.preventDefault();
        var _this = $(this);
        var _hash = this.hash;
        var currentTab = _hash.slice(1);
        if (_hash.length) {
            if (!_this.hasClass('active')) {
                $('.manager-item a.active').removeClass('active');
                _this.addClass('active');
            }
            if (!$(currentTab).hasClass('active')) {
                $('.tab-content.active').removeClass('active');
                $(`.tab-content.${currentTab}`).addClass('active');
            }
        }
    })
}

function addBookBtn() {
    //do something
    $('.btn-add').on('click', function() {
        $('.popup-book-add').addClass('show');
    })
    $('.close-popup').on('click', function() {
        $('.popup-book-add').removeClass('show');
    })
}
// example edit book
function editBtn() {
    $('.close-popup').on('click', function() {
        $('.popup-book-edit').removeClass('show');
    })
    $('.btn[data-type="edit"]').on('click', function() {
        var _this = $(this);
        $('.popup-book-edit').addClass('show');
        var currentRow = _this.parentsUntil("tbody").children('td');
        var currentInput = $('.popup-book-edit .container').children('input');
        for(var i = 0; i < currentInput.length; i ++) {
            $(currentInput[i]).val($(currentRow[i]).text());
        }

    })
}

function removeBtn() {
    $('.btn[data-type="remove"]').on('click', function() {
        var _this = $(this);
        _this.parentsUntil("tbody").remove();
    })
}
