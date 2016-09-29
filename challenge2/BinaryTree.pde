class BinaryTree 
{
  Node root;

  /* Recursive function to construct binary of size len from
  Inorder traversal in[] and Preorder traversal pre[].
  Initial values of inStrt and inEnd should be 0 and len -1. 
  The function doesn't do any error checking for cases where 
  inorder and preorder do not form a tree */
  public Node buildTree(String in[], String pre[], int inStrt, int inEnd) 
  {
    if (inStrt > inEnd) 
      return null;

    /* Pick current node from Preorder traversal using preIndex
    and increment preIndex */
    Node tNode = new Node(pre[preIndex++]);

    /* If this node has no children then return */
    if (inStrt == inEnd)
      return tNode;

    /* Else find the index of this node in Inorder traversal */
    int inIndex = search(in, inStrt, inEnd, tNode.data);

    /* Using index in Inorder traversal, construct left and
    right subtress */
    tNode.left = buildTree(in, pre, inStrt, inIndex - 1);
    tNode.right = buildTree(in, pre, inIndex + 1, inEnd);

    return tNode;
  }

  /* UTILITY FUNCTIONS */
  
  /* Function to find index of value in arr[start...end]
  The function assumes that value is present in in[] */
  int search(String arr[], int strt, int end, String value) 
  {
    int i;
    for (i = strt; i <= end; i++) 
    {
      if (arr[i].equals(value))
        return i;
    }
    return i;
  }

  /* This funtcion is here just to test buildTree() */
  void printInorder(Node node) 
  {
    if (node == null)
      return;

    /* first recur on left child */
    printInorder(node.left);

    /* then print the data of node */
    System.out.print(node.data + " ");

    /* now recur on right child */
    printInorder(node.right);
  } 
  
  public void printLeafNodes(Node node) {
    if(node.left == null && node.right == null) {
      outStr.append(node.data);
    } 
    else {      
      //Recurse on left s  ubtree
      if(node.left != null) {
        printLeafNodes(node.left);
      }
      //Recurse on right subtree
      if(node.right != null) {
        printLeafNodes(node.right);
      }
    }
  }
}