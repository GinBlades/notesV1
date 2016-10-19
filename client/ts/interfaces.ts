interface INotebook {
    id: number|string;
    name: string;
    ancestry: string;
    user_id: number|string;
    visibility: string;
    description: string;
    notes?: INote[];
}

interface INote {
    id: number|string;
    notebook?: INotebook;
    notebook_id: number|string;
    name: string;
    body: string;
    visibility: string;
    summary: string;
}
