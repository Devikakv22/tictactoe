def Analyse_Board(board):
  cb=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  for i in range(0,8):
    if(board[cb[i][0]]!=0 and board[cb[i][0]]==board[cb[i][1]] and board[cb[i][1]]==board[cb[i][2]]):
      return board[cb[i][0]]

  return 0

def minmax(board,player):
  pos=-1
  value=-2
  x=Analyse_Board(board)
  if(x!=0):
    return (x*player)
  for i in range(0,9):
    if(board[i]==0):
      board[i]=player
      score=-minmax(board,-1*player)
      board[i]=0
      if(score>value):
        value=score
        pos=i
  if(pos==-1):
     return 0

  return value

def CompTurn(board):
  pos=-1
  value=-2
  for i in range(0,9):
    if(board[i]==0):
      board[i]=1
      score=-minmax(board,-1)
      board[i]=0
      if(score>value):
        value=score
        pos=i

  board[pos]=1

def User1Turn(board):
  pos=int(input("Enter X's position from [1,2,3,......9]:"))
  if(board[pos-1]!=0):
    print("Invalid Position")
    exit(0)

  board[pos-1]=-1

def User2Turn(board):
  pos=int(input("Enter O's position from [1,2,3,......9]:"))
  if(board[pos-1]!=0):
    print("Invalid Position")
    exit(0)

  board[pos-1]=1

def Show_board(board):
  for i in range(0,9):
    if(i%3==0 and i>0):
      print("\n")
    if(board[i]==0):
      print("_ ",end=" ")
    elif(board[i]==-1):
      print("X ",end=" ")
    else:
      print("O ",end=" ")


  print("\n\n")

def main():
  choice=input("Enter 1 for single player,2 for Multiplayer:")
  choice=int(choice)

  board=[0,0,0,0,0,0,0,0,0]
  if(choice==1):
    print("Computer:O vs You:X")
    player=int(input("Enter you play 1(st) or 2(nd)"))
    for i in range(0,9):
      if(Analyse_Board(board)!=0):
        break
      if((i+player)%2==0):
        CompTurn(board);

      else:
        Show_board(board);
        User1Turn(board);

  else:
    print("Player 1:X vs Player 2:O")
    for i in range(0,9):
      if(Analyse_Board(board)!=0):
        break
      if((i)%2==0):
        Show_board(board);
        User1Turn(board);

      else:
        Show_board(board);
        User2Turn(board);

  x=Analyse_Board(board)
  if(x==0):
    Show_board(board);
    print("Draw");
  if(x==-1):
    Show_board(board);
    print("Player X Win!!!!!!!!!!!! O Losssssssss!!!!!!!!!!");
  if(x==1):
    Show_board(board);
    print("Player O Win!!!!!!!!!!! X Losssssssss!!!!!!!!!!");
  print("Thanks for playing")
