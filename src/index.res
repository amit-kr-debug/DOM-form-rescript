@val external document: {..} = "document"
@val external window: {..} = "window"

let getElementById = (id: string) => {
  document["getElementById"](id)
}

let addClass = (element, className): unit => {
  element["classList"]["add"](className)
}

let removeClass = (element, className_1, className_2): unit => {
  element["classList"]["remove"](className_1, className_2)
}

let textEditor = getElementById("textEditor")
let textView = getElementById("textView")

let updateTextView = event => {
  textView["innerText"] = event["target"]["value"]
}
textEditor["addEventListener"]("input", updateTextView)

type size =
  | Small
  | Regular
  | Large

let selectSize = (size: size) => {
  switch size {
  | Small => {
      addClass(textView, "text-sm")
      removeClass(textView, "text-2xl", "text-6xl")
    }
  | Regular => {
      addClass(textView, "text-2xl")
      removeClass(textView, "text-sm", "text-6xl")
    }
  | Large => {
      addClass(textView, "text-6xl")
      removeClass(textView, "text-sm", "text-2xl")
    }
  }
}

let selectSmall = getElementById("selectSmall")
let selectRegular = getElementById("selectRegular")
let selectLarge = getElementById("selectLarge")

selectSmall["addEventListener"]("change", () => selectSize(Small))
selectRegular["addEventListener"]("change", () => selectSize(Regular))
selectLarge["addEventListener"]("change", () => selectSize(Large))

selectSize(Regular)
