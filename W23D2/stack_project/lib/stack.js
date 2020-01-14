// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
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

class Stack {
  constructor(){
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  push(value){
    let current = new Node(value);
    if (this.length === 0){
      this.bottom = current;
    } else {
      current.next = this.top;
    }
    
    this.top = current;
    this.length += 1;
    return this.length;
  }

  pop(){
    if (!this.top){
      return null;
    }
    let popped = this.top;
    if (this.top === this.bottom){
      this.bottom = null;
      this.top = null;
    }
    if (this.length >= 2){
      this.top = this.top.next;
    }
    this.length--;
    return popped.value;
  }

  size(){
    return this.length;
  }
}

exports.Node = Node;
exports.Stack = Stack;
