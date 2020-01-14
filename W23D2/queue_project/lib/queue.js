// ============================================================================
// Implementation Exercise: Queue
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Queue and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
  constructor(value){
    this.value = value;
    this.next = null;
  }
}

class Queue {
  constructor(){
    this.front = null;
    this.back = null;
    this.length = 0;
  }

  enqueue(val) {
    const current = new Node(val);
    if (!this.front) {
      this.front = current;
      this.back = current;
    } else {
      this.back.next = current;
      this.back = current;
    }
    return ++this.length;
  }

  dequeue(){
    if (!this.front){
      return null;
    }
    const current = this.front;
    if (this.front === this.back){
      this.front = null;
      this.back = null;
    }
    this.front = current.next;
    this.length -= 1;
    return current.value;
  }

  size(){
    return this.length;
  }
}

exports.Node = Node;
exports.Queue = Queue;