화면 전환 방식  
- 스토리보드 활용 또는 코드 활용  
  
: present 방식, 뷰컨에서 다른 뷰컨을 호출하여 전환하기 
-> present 메서드에 이동할 뷰컨을 넘기면 이전화면의 뷰컨에 표시됨  
-> 애니메이션 효과 bool로 주기  
-> completion 클로저 : 화면 전환이 완료되는 시점에 클로저가 호출됨, 비동기 처리이기 때문에 코드 작업이 필요할 때 사용  
-> 이전화면으로 돌아가는 메소드 : dismiss method  
=> 기존화면을 덮고 있는 화면을 걷어내는 방식  

: navigation controller 사용하기  
-> 계층적인 뷰를 관리하기 위한 컨트롤러  
-> navigation stack 사용  
-> push view controller, pop view controller 사용  
-> push (새로운 화면으로 이동할 뷰컨의 인스턴스, 화면전환시 애니메이션 사용 여부)  
-> pop (이전 화면 이동시 애니메이션 사용 여부)  

  
: 화면 전환용 객체인 세그웨이(segueway)를 사용  
-> 두개의 뷰컨 사이에 연결된 화면 전환 객체  
-> 스토리보드를 활용해서 출발지, 목적지를 직접 지정하는 방식  
-> 출발점이 뷰컨 자체인 경우 : Manual Segueway  
-> 출발점이 button, shell인 경우 :  Action Segueway  
-> Acton segueway 의 종류 : show, show detail, present modally, present as popover, custom  
