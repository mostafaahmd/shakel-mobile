import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shakel_mobile/features/create_room/data/services/room_image_storage_service.dart';
import 'package:shakel_mobile/features/create_room/presentation/cubit/create_room_cubit.dart';
import 'package:shakel_mobile/features/create_room/presentation/pages/create_room_flow_screen.dart';
import 'package:shakel_mobile/features/create_room/presentation/pages/upload_room_photo_screen.dart';
import 'package:shakel_mobile/features/design_studio/domain/services/interior_prompt_composer.dart';

void main() {
  testWidgets('wizard uses the Cubit provided by its parent route',
      (tester) async {
    final cubit = CreateRoomCubit(
      imageStorageService: const RoomImageStorageService(),
      promptComposer: const InteriorPromptComposer(),
    );
    addTearDown(cubit.close);

    await tester.pumpWidget(
      BlocProvider<CreateRoomCubit>.value(
        value: cubit,
        child: const MaterialApp(home: CreateRoomFlowScreen()),
      ),
    );

    final firstStepContext = tester.element(find.byType(UploadRoomPhotoScreen));

    expect(
      BlocProvider.of<CreateRoomCubit>(firstStepContext),
      same(cubit),
    );
  });
}
