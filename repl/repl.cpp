#include<cstdio>
#include <cstring>
#include <string>
#include <iostream>
#include <gcits.hf>

using namespace std;

void cli_ui(char* response){
	char line[4096];
	while (true) {
		fgets(line, 4096, stdin);
		if (!strcmp(line, "%\n")) {
			break;
		}
		strcat(response, line);
	}
}

string fetchUtf8(GciSession session, OopType oop, int64 bufferSize)
{
    string resultString(bufferSize, 0);
    GciErrSType error;
    int64 requiredSize = 0;
    GciTsFetchUtf8(session,
                   oop,
                   (ByteType *)&resultString[0],
                   bufferSize,
                   &requiredSize,
                   &error);
    cout << requiredSize << std::endl;
    if (requiredSize > bufferSize) {
        return fetchUtf8(session, oop, requiredSize);
    } else {
        return resultString;
    }
}

int main() {
	GciErrSType error;
	GciSession session = GciTsLogin("!tcp@localhost#server!LispParser",
				        "",
				        "",
				        false,
				        "!tcp@localhost#netldi:LispParser_ldi#task!gemnetobject",
				        "DataCurator",
				        "swordfish",
				        0,
				        0,
				        &error);
	if (error.number > 0 || error.fatal > 0) {
	cout << error.message << "\n";
	return 1;
	}
	char response[4096];
	char line[4096];
	while (true) {
		fputs("lispGs>", stdout);
		fgets(line, 4096, stdin);
		if (!strcmp(line, "run\n")) {
			cli_ui(response);
			string source(response);
			OopType resultOop = GciTsExecute(session,
                                     source.c_str(),
                                     OOP_CLASS_Utf8,
                                     OOP_ILLEGAL,
                                     OOP_NIL,
                                     0,
                                     0,
                                     &error);
			string resultString = fetchUtf8(session, resultOop, 14);
			cout << resultString << "\n";
		} else if (!strcmp(line, "exit\n")) {
			GciTsLogout(session, &error);
			return 0;
		}
	}
}
