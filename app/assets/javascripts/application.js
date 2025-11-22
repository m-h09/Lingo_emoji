console.log("application.js loaded")
console.log("application.js START");
console.log("✅ application.js loaded");

//出力結果表示

function initSelectToggle() {
  const selectToggle = document.getElementById("js_select-Toggle");
  if (selectToggle) {
    selectToggle.value ="";
    //セレクトメニューが変更されたら実行
    selectToggle.addEventListener('change', () => {
      //選択されたvalueを取得
      const toggleVal = selectToggle.value;
      document.querySelectorAll('.bl_selectCont').forEach(selectCont => {
        //各コンテンツのIDがtoggleValと一致するか確認して条件に応じてis_activeクラスを制御
        const isActive = selectCont.id === toggleVal;
        // isActiveがtrueならis_activeクラスを追加、falseなら削除
        selectCont.classList.toggle('is_active', isActive);
      });
    });
  }
}
document.addEventListener("turbo:load", initSelectToggle);
document.addEventListener("DOMContentLoaded", initSelectToggle);

//クリアボタン処理
document.addEventListener("DOMContentLoaded", () => {
  const clearBtn   = document.getElementById("clear-btn");
  const textArea   = document.querySelector("textarea[name='base_prompt']");
  const outputDiv  = document.getElementById("txt-body");

  if (clearBtn) {
    clearBtn.addEventListener("click", () => {
      if (textArea) textArea.value = "";        // 入力欄を空にする
      if (outputDiv) outputDiv.textContent = ""; // 出力結果も空にする
    });
  }
});

// リロード時だけリセット
window.addEventListener("load", () => {
  const [navEntry] = performance.getEntriesByType("navigation");
  if (navEntry && navEntry.type === "reload") {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = ""; // 入力欄を空にする
    if (outputDiv) outputDiv.textContent = ""; // 出力結果も空にする
  }
});

// 戻る/進む など BFCache 復元時もリセット
window.addEventListener("pageshow", (event) => {
  if (event.persisted) {
    const textArea = document.querySelector("textarea[name='base_prompt']");
    const outputDiv = document.getElementById("txt-body");
    if (textArea) textArea.value = "";
    if (outputDiv) outputDiv.textContent = "";
  }
});

// テンプレート取得処理
function initTemplates() {
  const emoji = document.getElementById("js-emoji");
  const tone = document.getElementById("js-tone");
  const category = document.getElementById("js-category");
  const list = document.getElementById("templates-list");

  if (!emoji || !tone || !category || !list) return;

  function fetchTemplates() {

    const params = new URLSearchParams({
      emoji: emoji.value,
      tone: tone.value,
      category: category.value
    });

    fetch(`/templates?${params.toString()}`, {
      method: "GET",
      headers: { "Accept": "text/html", "X-Requested-With": "XMLHttpRequest"}
    })
      .then(res => res.text())
      .then(html => {
        list.innerHTML = html;
        attachCopyHandlers();
      })
      .catch(err => console.error("fetch failed:", err));
  }

  // change イベントにバインド
  [emoji, tone, category].forEach(sel => {
    sel.addEventListener("change", fetchTemplates);
  });
}

// Turboと通常ロード両方で呼ぶ
document.addEventListener("turbo:load", initTemplates);
document.addEventListener("DOMContentLoaded", initTemplates);

//コピー処理　テンプレート用
function attachCopyHandlers() {
  const buttons = document.querySelectorAll(".copy-btn");

  buttons.forEach((btn) => {
    btn.addEventListener("click", async () => {
      try {
        const content = btn.getAttribute("data-content") || "";
        const toast = btn.closest(".copy-wrapper")?.querySelector(".copy-toast");

        if (!window.isSecureContext) throw new Error("insecure");
        await navigator.clipboard.writeText(content.trim());

        if (toast) {
          toast.style.display = "block";
          setTimeout(() => {
            toast.style.display = "none";
          }, 1500);
        }
      } catch (e) {
        console.error("copy failed:", e);
      }
    });
  });
}

document.addEventListener("turbo:load", attachCopyHandlers);
document.addEventListener("DOMContentLoaded", attachCopyHandlers);

// 自動生成エリアのコピー処理
document.addEventListener("turbo:load", () => {
  const btn = document.getElementById("copy-btn");
  const txt = document.getElementById("txt-body");
  const toast = document.getElementById("copy-toast");

  if (btn && txt) {
    btn.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(txt.textContent.trim());
        if (toast) {
          toast.style.display = "block";
          setTimeout(() => { toast.style.display = "none"; }, 1500);
        }
      } catch (err) {
        console.error("copy failed:", err);
      }
    });
  }
});


document.addEventListener("turbo:load", initRadioVisibility);
document.addEventListener("DOMContentLoaded", initRadioVisibility);

function initRadioVisibility() {
  // ▼ PC
  setupRadioToggle("emoji-select-pc", "emoji-radio-group-pc");

  // ▼ SP
  setupRadioToggle("emoji-select-sp", "emoji-radio-group-sp");
}


//-----------------------------------------
// 共通：指定IDの select と radioGroup を紐付けて制御
//-----------------------------------------
function setupRadioToggle(selectId, groupId) {
  const select = document.getElementById(selectId);
  const radioGroup = document.getElementById(groupId);

  if (!select || !radioGroup) return; // その画面に要素が無ければスキップ

  function toggle() {
    const value = select.value;
    console.log(`${selectId} 選択:`, value);

    // kansai のときだけ非表示
    if (value === "kansai") {
      radioGroup.style.display = "none";
    } else {
      radioGroup.style.display = "flex"; // d-flex のまま維持
    }
  }

  toggle(); // 初回反映
  select.addEventListener("change", toggle); // セレクト変更時
}

// Bootstrapのタブ初期化
function setupRadioToggle(selectId, groupId) {
  const select = document.getElementById(selectId);
  const radioGroup = document.getElementById(groupId);

  if (!select || !radioGroup) return;

  function toggle() {
    const value = select.value;

    if (value === "kansai") {
      radioGroup.classList.add("d-none");
    } else {
      radioGroup.classList.remove("d-none");
    }
  }

  toggle();
  select.addEventListener("change", toggle);
}
