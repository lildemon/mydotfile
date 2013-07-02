
// AsyncTask was executed by .execute() method
private static final class AsyncInitGame // 声明为某类专用的静态class， 这个class不能被继承(final)， 也不会有隐式的引用当前实例 this
extends AsyncTask < String, Void, String > { // 泛型， 确保线程间参数类型的正确性（type-safe)， how they utilize this information?
											 // 1: paramet
	private final View root;
	private final Game game;
	private final TextView message;
	private final Drawable bg;

	public AsyncInitGame(
	View root,
	Drawable bg,
	Game game,
	TextView msg) {
		this.root = root;
		this.bg = bg;
		this.game = game;
		this.message = msg;
	}
	// runs on the UI thread
	@Override protected void onPreExecute() { // caller thread
		if (0 >= mInFlight++) {
			root.setBackgroundResource(R.anim.dots);
			((AnimationDrawable) root.getBackground()).start();
		}
	}
	// runs on the UI thread
	@Override protected void onPostExecute(String msg) { // caller thread
		if (0 >= --mInFlight) {
			((AnimationDrawable) root.getBackground()).stop();
			root.setBackgroundDrawable(bg);
		}
		message.setText(msg);
	}
	// runs on a background thread
	@Override protected String doInBackground(String...args) { // new thread
		return ((1 != args.length) || (null == args[0])) ? null : game.initialize(args[0]);
	} 
}

refs:
http://developer.android.com/reference/android/os/AsyncTask.html#Class_Overview
http://stackoverflow.com/questions/4068984/running-multiple-asynctasks-at-the-same-time-not-possible
http://www.vogella.com/articles/AndroidBackgroundProcessing/article.html
http://stackoverflow.com/questions/3041971/android-service-killed
http://about-android.blogspot.sg/2010/07/lifecycle-of-android-application.html
http://www.fattybeagle.com/2011/02/14/android-asynctasks-during-a-screen-rotation-part-i/
http://stackoverflow.com/questions/2620917/how-to-handle-an-asynctask-during-screen-rotation
http://logc.at/2011/11/08/the-hidden-pitfalls-of-asynctask/
http://bon-app-etit.blogspot.sg/2013/04/the-dark-side-of-asynctask.html
http://stackoverflow.com/questions/3028306/download-a-file-with-android-and-showing-the-progress-in-a-progressdialog
http://www.shanekirk.com/2012/04/asynctask-missteps/