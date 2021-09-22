class ProjectData {
  static List data = [
    {
      "title": "全國智慧製造大數據分析競賽",
      "text":
          "此系統將多個感測器監測的數據進行熔爐分類的動作。首先需要檢查個感測器的數據是否遺失，若遺失則捨棄。檢查完後為了增加特徵點將數據分析做最大值、最小值、平均值與標準差，接著將每個感測器的數據畫成一張曲線圖，在將全部資料放進 CNN 訓練，接著透過訓練好的網路進行數據分類。",
    },
    {
      "title": "即時多人人臉辨識系統",
      "text":
          "本專題主要的重點為即時辨識，也就是要實現快速定位人臉，透過 YOLO 的快速抓取臉部截取出的人臉接著至 Facenet 進行辨識以提升辨識效率。",
    },
    {
      "title": "8051 單晶片自走車",
      "text":
          "利用 8051 控制兩個時間中斷與一個按鍵中斷，並計算超音波距離、七段顯示器與藍芽通訊。此系統也可利用 APP 可控制自動與手動模式。",
    },
    {
      "title": "8051 單晶片記憶遊戲",
      "text":
          "利用 8051 控制 LED 的發光順序，隨著過關的次數增加發光的燈泡數量， 將數量寫在七段顯示器上。玩家則按照燈泡亮的順序依序按下相對應的按鈕，答對七段顯示器會加一，答錯則閃爍並重新第一關，總共三關。",
    },
    {
      "title": "支援無人機進行不間斷監控之無線充電排程研究",
      "text":
          "使用無人機觀察並監控野火分佈及其蔓延的即時狀況，還可以進行緊急通知，將人員和財產撤離危險區域。為了密切地監視野火的分佈，無人機必須在空中監視直到野火完全撲滅。使用無人機監視野火分布能使消防員即時的了解火勢，有無人機隨時的監控野火分布(做為偵查的角色)，可以大大減少人員暴露在危險區域的情況，畢竟救火是分秒必爭的，晚了幾秒可能就處於火海之中。為了利用無人機來執行長時間的監控，我們必須克服無人機電源耗盡後的電源補機制。在此研究中，我們將考慮佈署無線充電板，來支援無人機執行長時間的監控任務。但是因為能佈署的無線充電板十分有限，當多台無人機同時需要充電時，有可能導致有些無人機無法即時取得電力，因而無法完成長時間監控任務。 本計畫為此設計了一個最佳的無線充電排程演算法，使得無人機的長時間監控任務得以順利完成。",
    },
    {
      "title": "智慧物聯網監控系統",
      "text":
          "此實作系統的目的在於建置一個民用為主的物聯網監控系統，希望可以使物聯網廣泛的在世界各地使用，即使是低階手機也可順暢使用。硬體部分利用 MAGA2560 進行感測器與開關狀態收集，並透過 ESP8266 利用 MQTT 進行接收與發送。在伺服器的部分，則是利用 PHP 控制資料庫、自動控制與網站後端。網站則是有新增感應器、開關、監視等功能，數據顯示則是利用 Javascript 生成區塊可達到動態新增與視覺化介面的效果。APP 則是使用 Android Studio，利用 Web 的方式將網頁呈現，為了使低階手機也能順暢使用。",
    },
    {
      "title": "生成對抗網絡最佳路徑規劃",
      "text": "為了使貨運公司物流配過程中，以最低的成本完成配送，但由於每位配送員有不同路徑選擇因素，因此透過GAN來生成最佳路徑。",
    },
    {
      "title": "移動式攝影機之車牌辨識系統",
      "text":
          "本專題主要的重點為移動式攝影機，也就是攝影機即使在移動的情形下也可以快速的定位車牌並辨識，而傳統大多數的車牌辨識都是使用 Thresholding 的影像分割技術將車牌的每一個字切出來後判別，而本系統採用 YOLO 並輸出 35 類，分別為車牌、0-9、A-Z 去掉 I 與 O，將偵測物件和辨識物件同時一起運算以提升辨識效率。",
    },
  ];
}
