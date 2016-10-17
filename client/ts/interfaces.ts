interface INotebook {
    name: string;
    ancestry: string;
    user_id: number|string;
    visibility: string;
    description: string;
}

interface INote {
    notebook_id: number|string;
    name: string;
    body: string;
    visibility: string;
    summary: string;
}
