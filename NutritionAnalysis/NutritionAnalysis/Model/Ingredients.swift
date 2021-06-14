

import Foundation
struct Ingredients : Codable {
	let text : String?
	let parsed : [Parsed]?

	enum CodingKeys: String, CodingKey {

		case text = "text"
		case parsed = "parsed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		parsed = try values.decodeIfPresent([Parsed].self, forKey: .parsed)
	}

    init(text : String, parsed : [Parsed]) {
        self.text = text
        self.parsed = parsed
    }
}
