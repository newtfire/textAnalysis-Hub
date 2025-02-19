#### **Tag Speaker Names**
Wrap all character names (e.g., "Mulan:", "Shang:", "Chi Fu:") in `<speaker>` tags.

- **Find:**  
  ```regex
  ^([A-Z][a-z]+(?:\s[A-Z][a-z]+)*)\s*:
  ```
- **Replace With:**  
  ```xml
  <speaker>\1</speaker>:
  ```

#### **Tag Dialogue Lines**
Wrap dialogue lines in `<dialogue>` tags.

- **Find:**  
  ```regex
  (<speaker>.*?</speaker>):\s*(.*)
  ```
- **Replace With:**  
  ```xml
  \1: <dialogue>\2</dialogue>
  ```

#### **Tag Scene Descriptions**
Wrap scene descriptions (inside `[ ... ]`) in `<scene>` tags.

- **Find:**  
  ```regex
  \[(.*?)\]
  ```
- **Replace With:**  
  ```xml
  <scene>\1</scene>
  ```

#### **Tag Songs**
Wrap song lyrics inside `<song>` tags.

- **Find:**  
  ```regex
  <scene>Song: (.*?)</scene>
  ```
- **Replace With:**  
  ```xml
  <song>\1</song>
  ```

