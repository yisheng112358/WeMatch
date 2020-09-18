$(document).ready(() => {

    var itemPerPage = 3; // 一頁幾個商品
    var nowPage = 1;
    var totalPage = 0; // 全部頁數

    $.ajax({
        url: "/WeMatch_dev/product/retrieve",
        // url: "RetrieveProductServlet.do",
        // $url: "<c:url value='/product/retrieveProduct'/>",
        // data: {
        //     // action: "RetrieveProduct"
        //     action: "RetrieveProduct"
        // },
        type: "get",
        dataType: "json",
        success: function(data) {
            // 上傳檔案
            function uploadDataToTable(productCategory) {
                var txt = ' ';
                var dataLength = 0;
                for (let i = 0; i < data.length; i++) {
                    if (data[i].category == productCategory) {

                        var base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(data[i].thumbnail)));
                        txt += "<tr><td>" +
                            "<a href='ProductExamPage?productID=" + data[i].productID + "'><img alt='No image' src='data:image/jpg;base64," + base64String + "'hight='250px' width='250px'></a>" +
                            '</td><td class="pName" id="' + data[i].productID + '" style="width:200px;">' + data[i].productName +
                            '</td><td style="width:100px;"><h6 style="color:black;">$ ' + data[i].price + '</h6></td><td>' +
                            "<a style='display:block;' href='ProductEditPage?productID=" + data[i].productID + "'><input class='cartbutton' type='button' value='修改資訊' style='width:100px;'></a>" +
                            "<a style='display:block;' href='deleteProduct?productID=" + data[i].productID + "'><input class='cartbutton' type='button' value='刪除商品' style='width:100px;'></a>" +
                            '</td></tr>';
                        dataLength++;
                    }
                }
                // txt += ' ';
                $("#content" + productCategory).append(txt);

                // 計算總頁數
                totalPage = Math.ceil(dataLength / itemPerPage);

                // 建立頁面數字連結
                $("#page" + productCategory).append('<br/');
                $("#page" + productCategory).append('<h3 id="pre' + productCategory + '"> << </h3>');

                for (let i = 0; i < totalPage; i++) {
                    // 建立頁面數字
                    $("#page" + productCategory).append('<h3>' + (i + 1) + '</h3>');

                    $("#page" + productCategory + " h3").eq(i + 1).click(() => {
                        $("#content" + productCategory + " tr").hide();
                        for (let item = i * itemPerPage; item < (i + 1) * itemPerPage; item++) {
                            $("#content" + productCategory + " tr").eq(item).show();
                        }
                        nowPage = i + 1;
                        $("#nowPage").text(nowPage);
                    })
                }
                $("#page" + productCategory).append('<h3 id="next' + productCategory + '">>></h3>');

                // 上一頁
                $("#pre" + productCategory).click(() => {
                        if (nowPage > 1) {
                            nowPage = nowPage - 1;
                            $("#page" + productCategory + " h3").eq(nowPage).click();
                            $("#nowPage").text(nowPage);
                        }
                    })
                    // 下一頁
                $("#next" + productCategory).click(() => {
                        if (nowPage < totalPage) {
                            nowPage = nowPage + 1;
                            $("#page" + productCategory + " h3").eq(nowPage).click();
                            $("#nowPage").text(nowPage);
                        }
                    })
                    // 初次建立
                $("#page" + productCategory + " h3").eq(1).click();

            }

            uploadDataToTable("Massager");
            uploadDataToTable("Yoga");
            uploadDataToTable("Supplement");

        }
    })
})