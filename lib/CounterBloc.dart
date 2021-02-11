import 'package:bloc/bloc.dart';

enum CounterEvents { increment, decrement }
//here we pass two things as parameters inside bloc the first one is event and second one is the datatype of the output state

class CounterBloc extends Bloc<CounterEvents, int> {
  @override
  // TODO: implement initialState
  int get initialState => 0;

  //0 because we want the counter value to be 0 when the application starts

  @override
  //async is declared as this fucntion countinously needs to accept input and show output
  Stream<int> mapEventToState(CounterEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case CounterEvents.increment:
        yield state +1;
        break;
        //the difference between yield and return is that yied returns the value but doesnot terminates the function where as return terminates the function
      case CounterEvents.decrement:
        yield state -1;
        break;
    }
  }
}
