public class Wave {
	// parameters
	public float l = 5; // well of width L
	public float dy = 0.05; // spatial step size
	public float dt = 0.005; // temporal step size

	public float nx = (int)Math.floor(l/dy)+1; // number of points on x axis
	public float ny = (int)Math.floor(l/dy)+1; // num of points on y axis
	
	public float rx = -dt / (2*Math. sqrt(-1) * dy*dy);
	public float ry = -dt / (2*Math. sqrt(-1) * dy*dy);

	public float angle; // initial angle

	// init position - center of the wave (im setting it to center)
	public float x0 = l/5;
	public float y0 = l/5;

	// potential
	public float v = ArrayList

	public Wave(float waveAngle) {
		angle = waveAngle;


	}
}
