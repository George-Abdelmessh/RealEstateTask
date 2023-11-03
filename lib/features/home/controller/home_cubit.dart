import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/core/constant/app_image.dart';
import 'package:real_estate_task/features/home/controller/home_states.dart';
import 'package:real_estate_task/features/home/view/cards/slider_content_card.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int index = 0;
  int selectedView = 0;
  final PageController pageController = PageController(initialPage: 0);

  final List<SliderContentCard> sliderList = [
    SliderContentCard(
      title: 'Multi-Services for Your Real Estate Needs',
      image: AppImage.slider1,
      content: '',
      btnTitle: 'order',
    ),
    SliderContentCard(
      title: 'Leasing, Maintenance, and Managing Your Properties with Ease',
      image: AppImage.slider2,
      content: '',
      btnTitle: 'My Assets',
    ),
    SliderContentCard(
      title: 'Management platform real estate asset ',
      image: AppImage.slider3,
      content: 'Utilizing a variety of properties oversight and construction.',
      btnTitle: 'Request',
    ),
  ];

  void changeIndex(int currentIndex) {
    index = currentIndex;
    emit(ChangeSliderState());
  }

  void changeView(int currentIndex) {
    selectedView = currentIndex;
    pageController.animateToPage(
      selectedView,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    emit(ChangeViewState());
  }
}
