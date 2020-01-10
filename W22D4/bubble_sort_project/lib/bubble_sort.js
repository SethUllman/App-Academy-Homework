function swap(array, idx1, idx2) {
    const first = array[idx1];
    array[idx1] = array[idx2];
    array[idx2] = first;
    return array;
}

function bubbleSort(array) {
    let sorted = false;
    while(!sorted){
        sorted = true;
        for (let i = 0; i < array.length - 1; i++){
            let first = array[i];
            let second = array[i+1];
            if (first > second){
                sorted = false;
                array[i] = second;
                array[i+1] = first;
            }
        }
    }
    return array;
}


module.exports = {
    bubbleSort,
    swap
};