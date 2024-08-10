public class Wave {
	// parameters
	public float l = 5; // well of width L
	public float dy = 0.05; // spatial step size
	public float dt = 0.005; // temporal step size

	public float nx = (int)Math.floor(l/dy)+1; // number of points on x axis
	public float ny = (int)Math.floor(l/dy)+1; // num of points on y axis
	
	public float rx = -dt / (2*Math.sqrt(-1) * dy*dy); // Math.sqrt(-1) = imaginary number
	public float ry = -dt / (2*Math.sqrt(-1) * dy*dy);

	public float angle; // initial angle

	// init position - center of the wave (im setting it to center)
	public float x0 = l/5;
	public float y0 = l/5;

	// potential
	public List<List<float>> v = new ArrayList<List<float>>();

	public float ni = (nx - 2)*(ny - 2); // no. of unknown factors

	// matrices for crank-nicolson calculus
	public List<List<float>> a = new ArrayList<List<float>>();
	public List<List<float>> m = new ArrayList<List<float>>();

	// sparce matrix
	public List<List<float>> asp = new ArrayList<List<float>>();

	public Wave(float waveAngle) {
		angle = waveAngle;

		// initialize matrices
		v = initMatrix(ny, ny);
		a = initMatrix(ni, ni);
		m = initMatrix(ni, ni);
		asp = initMatrix(a,a);

		// filling in A and M
		for (int i = 0; i < ni; i++) {
			int n1 = 1+(int)Math.floor(i / ny);
			int n2 = 1+(int)Math.floor(i % ny);

			a.get(i).get(i) = 1 + (2*rx) + (2*ry) + Math.sqrt(-1) * dt/2 * v.get(n1).get(n2);
			m.get(i).get(i) = 1 + (2*rx) - (2*ry) + Math.sqrt(-1) * dt/2 * v.get(n1).get(n2);

			// lower lone diagonal
			if (n1 != 1) {
				int index = (n1-2) * (ny - 2) + n2-1;
				a.get(i).get(index) = -ry;
				m.get(i).get(index) = ry;
			}

			if (n1 != (nx -2)) { // upper lone diagonal
				int index = n1 * (ny-2) + n2-2;
				a.get(i).get(index) = -ry;
				m.get(i).get(index) = ry;
			}

			// lower main diagonal
			if (n2 != 1) {
				a.get(i).get(i-1) = -rx;
				m.get(i).get(i-1) = rx;
			}

			// upper main doagonal
			if (n2 != (ny - 2)) {
				a.get(i).get(i+1) = -rx;
				m.get(i).get(i+1) = rx;
			}
		}


	}

	private List<List<float>> initMatrix(int x, int y) {
		List<List<float>> matrix = new ArrayList<List<float>>();
		
		for (int i = 0; i < y; i++) {
			matrix.add(new ArrayList<float>());
			for (int j = 0; j < x; j++) {
				matrix.get(i).add(0);
			}
		}

		return matrix;
	}
}
