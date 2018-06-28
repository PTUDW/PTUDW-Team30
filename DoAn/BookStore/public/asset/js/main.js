$(document).ready(function() {
        'use strict';
        toggleMenu();
        toggleCategories();
        carousel();
        adminManagerBar('.manager');
        tabManager('.manager');
        additemBtn();
        editBtn();
        removeBtn();
        // b_addBtn();
        // k_addBtn();
        // ih_addBtn();
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
        node.css('background-image', 'url("/img/carousel-' + i + '.jpg")');
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

function additemBtn() {
    //do something
    $('.btn-add').on('click', function() {
        $('.popup-item-add').addClass('show');
    })
    $('.close-popup').on('click', function() {
        $('.popup-item-add').removeClass('show');
    })
}
// example edit item
function editBtn() {
    $('.close-popup').on('click', function() {
        $('.popup-item-edit').removeClass('show');
    })
    $('.btn[data-type="edit"]').on('click', function() {
        var _this = $(this);
        $('.popup-item-edit').addClass('show');
        var currentRow = _this.parentsUntil("tbody").children('td');
        var currentInput = $('.popup-item-edit .container').children('input');
        for (var i = 0; i < currentInput.length; i++) {
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


function detailBtn() {
    $('.btn[data-type="edit"]').on('click', function() {
        var _this = $(this);
        $('.popup-item-edit').addClass('show');
        var currentRow = _this.parentsUntil("tbody").children('td');
        var currentInput = $('.popup-item-edit .container').children('input');
        for (var i = 0; i < currentInput.length; i++) {
            $(currentInput[i]).val($(currentRow[i]).text());
        }

    })
}

// function b_addBtn() {
//     $("#b-add").click(function() {
//         var b_img = $("#b-img[type=file]").val().split('\\').pop();
//         var b_id = $("#b-id").val();
//         var b_name = $("#b-name").val();
//         var b_author = $("#b-author").val();
//         var b_publisher = $("#b-publisher").val();
//         var b_issuingHouse = $("#b-issuingHouse").val();
//         var b_kind = $("#b-kind").val();
//         var b_price = $("#b-price").val();
//         var b_amount = $("#b-amount").val();
//         var additem = `<tr><td><center><img src='img/` + b_img + `' alt='item' width='20px' height='30px'></center></td><td>` + b_id + `</td><td>` + b_name + `</td><td>` + b_author + `</td><td>` + b_publisher + `</td><td>` + b_issuingHouse + `</td><td>` + b_kind + `</td><td>` + b_price + `</td><td>` + b_amount +
//             `<td><button id='item1' class='btn btn--small btn--orange' data-type='edit'><span><i class='fa fa-pencil' aria-hidden='true'></i> Edit</span></button>
//                         <button class='btn btn--small btn--red' data-type='remove'><span><i class='fa fa-trash' aria-hidden='true'></i> Remove</span></button>
//                         </td>` + `</td></tr>`;
//         $("table tbody").append(additem);
//     });
// };

// function k_addBtn() {
//     $("#k-add").click(function() {
//         var k_id = $("#k-id").val();
//         var k_name = $("#k-name").val();
//         var k_des = $("#k-des").val();
//         var k_catelogy = $("#k-catelogy").val();
//         var additem = `<tr><td>` + k_id + `</td><td>` + k_name + `</td><td>` + k_des + `</td><td>` + k_catelogy + `<td>
//                                     <button class="btn btn--small btn--orange" data-type="edit"><span><i class="fa fa-pencil" aria-hidden="true"></i> Edit</span></button>
//                                     <button class="btn btn--small btn--red" data-type="remove"><span><i class="fa fa-trash" aria-hidden="true"></i> Remove</span></button>
//                                 </td></tr>`;
//         $("table tbody").append(additem);
//     });
// };

// function ih_addBtn() {
//     $("#ih-add").click(function() {
//         var ih_id = $("#ih-id").val();
//         var ih_name = $("#ih-name").val();
//         var ih_contact = $("#ih-contact").val();
//         var ih_address = $("#ih-address").val(); 
//         var additem = `<tr><td>` + ih_id + `</td><td>` + ih_name + `</td><td>` + ih_contact + `</td><td>` + ih_address + `<td>
//                                     <button class="btn btn--small btn--orange" data-type="edit"><span><i class="fa fa-pencil" aria-hidden="true"></i> Edit</span></button>
//                                     <button class="btn btn--small btn--red" data-type="remove"><span><i class="fa fa-trash" aria-hidden="true"></i> Remove</span></button>
//                                 </td></tr>`;
//         $("table tbody").append(additem);
//     });
// };


function deleteBook() {
    $('.removeItem').on('click', function() {
        console.log("Vô đây");
        var id = $(this).data('proid');
        $('#txtProId_R').val(id);
        $('#frmRemoveItem').submit();
    });
}

function refrClock() {
    var d = new Date();
    var s = d.getSeconds();
    var m = d.getMinutes();
    var h = d.getHours();
    var date = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (s < 10) { s = "0" + s }
    if (m < 10) { m = "0" + m }
    if (h < 10) { h = "0" + h }
    if (date < 10) { date = "0" + date }
    if (month < 10) { month = "0" + month }
    document.getElementById("clock").value = year + '-' + month + '-' + date + ' ' + h + ':' + m + ':' + s;
}

function plus() {
    document.getElementById("qty").value = ++document.getElementById("qty").value;
}

function minus() {
    if (document.getElementById("qty").value > 1) {
        document.getElementById("qty").value = --document.getElementById("qty").value;
    }
}