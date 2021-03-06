HDrawablePool pool;

void setup() {
	size(640, 640);
	H.init(this).background(#202020);
	smooth();

	pool = new HDrawablePool(90);
	pool.autoAddToStage()
		.add(
			new HRect(6)
				.rounding(2)
				.anchorAt(H.CENTER)
				.noStroke()
		)

		.colorist( new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600).fillOnly() )

		.layout(
			new HGridLayout()
				.startLoc(9, height/2)
				.spacing(7, 0)
				.cols(90)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT)
						.range(6, 200)
						.speed(1)
						.freq(3)
						.waveform(H.SAW)
						.currentStep( pool.currentIndex()*3 )
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	H.drawStage();
}

