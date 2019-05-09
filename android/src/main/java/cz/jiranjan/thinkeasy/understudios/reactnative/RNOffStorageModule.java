
package cz.jiranjan.thinkeasy.understudios.reactnative;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class RNOffStorageModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNOffStorageModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNOffStorage";
  }

  private String resolvePath(String to) {
    return getReactApplicationContext().getFilesDir().getAbsolutePath() + '/' + to;
  }

  @ReactMethod
  public void saveSync(String to, String base64) {
    try {
      File f = new File(resolvePath(to));
      f.getParentFile().mkdirs();
      FileOutputStream stream = new FileOutputStream(f);
      try {
        stream.write(base64.getBytes());
      } finally {
        stream.close();
      }
    } catch (Exception ignored) {}
  }

  @ReactMethod
  public void save(String to, String base64, Promise promise) {
    try {
      File f = new File(resolvePath(to));
      f.getParentFile().mkdirs();
      FileOutputStream stream = new FileOutputStream(f);
      try {
        stream.write(base64.getBytes());
      } finally {
        stream.close();
      }
      promise.resolve(true);
    } catch (Exception e) {
      promise.reject("IO error", e.getMessage());
    }
  }


  @ReactMethod
  public void exists(String to, Promise promise) {
    File f = new File(resolvePath(to));
    promise.resolve(f.exists());
  }

  @ReactMethod
  public void path(String to, Promise promise) {
    promise.resolve(getReactApplicationContext().getFilesDir().getAbsolutePath() + '/' + to);
  }

  @ReactMethod
  public void read(String from, Promise promise) {
    try {
      File f = new File(resolvePath(from));
      FileInputStream fin = new FileInputStream(f);
      BufferedReader reader = new BufferedReader(new InputStreamReader(fin));
      StringBuilder sb = new StringBuilder();
      String line = null;
      while ((line = reader.readLine()) != null) {
        sb.append(line);
      }
      reader.close();
      fin.close();
      promise.resolve(sb.toString());
    } catch (Exception e) {
      promise.reject("IO error", e.getMessage());
    }
  }
}
