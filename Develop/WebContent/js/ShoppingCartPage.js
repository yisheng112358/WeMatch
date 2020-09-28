function retrievePerchaseAmount() {
    var allQuantities = document.querySelectorAll(".quantity");

    for (let i = 0; i < allQuantities.length; i++) {
        $.ajax({
            url: "/WeMatch_dev/shoppingCart/updateStock",
            data: {
                productId: allQuantities[i].getAttribute("name"),
                stock: allQuantities[i].value,
            },
            type: "get",
            dataType: "json",

        })
    }
}

$(document).ready(() => {
    var allItemsInCart = document.querySelectorAll("h4");
    var allItemsInCartLength = allItemsInCart.length;

    for (let i = 0; i < allItemsInCartLength; i++) {

        $("#minus" + allItemsInCart[i].getAttribute("id")).click(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal <= 0) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val("0");
            } else {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val(quantityVal - 1);
            }

            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);

            toltalAmountMoney()

        });

        $("#add" + allItemsInCart[i].getAttribute("id")).click(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal >= parseInt($("#stock" + allItemsInCart[i].getAttribute("id")).html())) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val($("#stock" + allItemsInCart[i].getAttribute("id")).html());
            } else {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val(quantityVal + 1);
            }

            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);

            toltalAmountMoney()

        });

        $("#quantity" + allItemsInCart[i].getAttribute("id")).blur(() => {
            var quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            if (quantityVal >= parseInt($("#stock" + allItemsInCart[i].getAttribute("id")).html())) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val($("#stock" + allItemsInCart[i].getAttribute("id")).html());
            }
            if (quantityVal <= 0) {
                $("#quantity" + allItemsInCart[i].getAttribute("id")).val("0");
            }
            quantityVal = parseInt($("#quantity" + allItemsInCart[i].getAttribute("id")).val());
            $("#itemTotal" + allItemsInCart[i].getAttribute("id")).html(parseInt($("#itemTotal" + allItemsInCart[i].getAttribute("id")).attr("name")) * quantityVal);
            toltalAmountMoney()
        });

    }

    function toltalAmountMoney() {
        var allItemsInCart1 = document.querySelectorAll("h4");
        var allItemsInCartLength1 = allItemsInCart1.length;
        var totalAmount = 0;
        var itemTotal = 0.0;
        for (let j = 0; j < allItemsInCartLength1; j++) {
            if ($("#itemTotal" + allItemsInCart1[j].getAttribute("id")).html() == "") {
                itemTotal = 0;
            } else {
                itemTotal = parseInt($("#itemTotal" + allItemsInCart1[j].getAttribute("id")).html());
            }
            totalAmount = totalAmount + itemTotal;
        }
        $("#totalAmount").val(totalAmount);
    }
    toltalAmountMoney()
})