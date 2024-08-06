// Screen Configurations
public static final int screenWidth = 500;
public static final int screenHeight = 500;

// Maze Builder
public class Maze {
	private static final int _width;
	private static final int _height;

	public List<List<String>> maze;

	public Maze(int width, int height, int resolution) {
		_width = width/resolution;
		_height = height/resolution;

		this.makeMaze();
	}

	public Maze(int width, int height) {
		this(width, height, 10);
	}

	private void makeMaze() {
		List<List<String>> theMaze = new ArrayList<String>();

		for (int i = 0; i < _width; i++) {
			for (int j = 0; j < _height; j++) {
				
			}
		}
	}
}


// Starting function
void setup() {
	size(screenWidth, screenHeight);

	Maze theMaze = new Maze(screenWidth, screenHeight);
}

// Main loop
void loop() {
	
}