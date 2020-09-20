function checkProductStock() {
    return true;
}

function checkProductPrice() {
    return true;
}

function checkProductName() {
    return true;
}

function checkBeforeSubmit() {
    return true;
}

function checkProductId() {
    return true;
}

const fileInput1 = document.querySelector('#thumbnailId');
const fileInput2 = document.querySelector('#detailImgId');
const preview1 = document.querySelector('#thumbnailPreview');
const preview2 = document.querySelector('#detailImgPreview');
const reader1 = new FileReader();
const reader2 = new FileReader();

function handleEvent(event) {
    if (event.type === "load") {
        preview1.src = reader1.result;
        preview2.src = reader2.result;
    }
}

function addListeners(reader) {
    reader1.addEventListener('loadstart', handleEvent);
    reader1.addEventListener('load', handleEvent);
    reader1.addEventListener('loadend', handleEvent);
    reader1.addEventListener('progress', handleEvent);
    reader1.addEventListener('error', handleEvent);
    reader1.addEventListener('abort', handleEvent);
    reader2.addEventListener('loadstart', handleEvent);
    reader2.addEventListener('load', handleEvent);
    reader2.addEventListener('loadend', handleEvent);
    reader2.addEventListener('progress', handleEvent);
    reader2.addEventListener('error', handleEvent);
    reader2.addEventListener('abort', handleEvent);
}

function handleSelected(e) {
    const selectedFile1 = fileInput1.files[0];
    const selectedFile2 = fileInput2.files[0];
    if (selectedFile1) {
        addListeners(reader1);
        reader1.readAsDataURL(selectedFile1);

    }
    if (selectedFile2) {
        addListeners(reader2);
        reader2.readAsDataURL(selectedFile2);
    }
}
fileInput1.addEventListener('change', handleSelected);
fileInput2.addEventListener('change', handleSelected);