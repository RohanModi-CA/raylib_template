//main.c


#include <stdlib.h>
#include "resources/lib/raylib/raylib.h"
#include "resources/world_funcs/camera_setup.h"
#include <stdio.h>
#include <math.h>



void initialize_window(int width, int height, int fps, const char* title){
    SetTraceLogLevel(LOG_FATAL); // Prevent Raylib from spamming the console
    const int screenWidth = 1400;
    const int screenHeight = 950;
    InitWindow(screenWidth, screenHeight, "LC - 3");
	DisableCursor();                    // Limit cursor to relative movement inside the window
    SetTargetFPS(fps);                   // Set our game to run at 60 frames-per-second
}

int launch_raylib()
{
	/* First we initialize our window and camera. */
	initialize_window(1300, 900, 30, "LC-3");
	Camera3D* camera = initialize_camera();


	/* Main Loop */
	while (!WindowShouldClose())        // Detect window close button or ESC key
	{
		UpdateCamera(camera, CAMERA_FREE);
		BeginDrawing();


			ClearBackground(RAYWHITE);

			// 3D, you can delete that for 2D.
			BeginMode3D(*camera);
			DrawGrid(150, 1.0f);


			EndMode3D();


		EndDrawing();
	}




	//--------------------------------------------------------------------------------------
	CloseWindow();        // Close window and OpenGL context



	free(camera);
	return 0;
}


int main(void)
{
	launch_raylib();
}
