struct YHOOK
{
HMODULE hMod;
BYTE *pFunction;
BYTE *pTrampoline;
DWORD cbOriginal;
};

void Hook(struct YHOOK *hk, LPCTSTR pszModule, LPCTSTR pszName, LPVOID pvNew);
void Unhook(struct YHOOK *hk);