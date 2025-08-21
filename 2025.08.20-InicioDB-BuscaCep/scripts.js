// Máscara de CEP (00000-000) e validação básica
const cepInput = document.getElementById('cep');
const ufInput = document.getElementById('uf');
const form = document.getElementById('formEndereco');
const erroCep = document.getElementById('cepErro');

function apenasNumeros(v) { return v.replace(/\D/g, ''); }

cepInput.addEventListener('input', (e) => {
    let v = apenasNumeros(e.target.value).slice(0, 8);
    if (v.length > 5) v = v.slice(0, 5) + '-' + v.slice(5);
    e.target.value = v;
    erroCep.style.display = 'none';
});

ufInput.addEventListener('input', (e) => {
    e.target.value = e.target.value.toUpperCase().replace(/[^A-Z]/g, '').slice(0, 2);
});

// Auto-preenchimento ViaCEP ao sair do campo CEP
cepInput.addEventListener('blur', async () => {
    const raw = apenasNumeros(cepInput.value);
    if (raw.length !== 8) { erroCep.style.display = 'block'; return; }
    try {
        const res = await fetch(`https://viacep.com.br/ws/${raw}/json/`);
        const data = await res.json();
        if (data.erro) { throw new Error('CEP não encontrado'); }
        document.getElementById('logradouro').value = data.logradouro || '';
        document.getElementById('bairro').value = data.bairro || '';
        document.getElementById('cidade').value = data.localidade || '';
        document.getElementById('uf').value = (data.uf || '').toUpperCase();
        erroCep.style.display = 'none';
    } catch (err) {
        erroCep.style.display = 'block';
    }
});

// Validação do formulário e demonstração de envio
form.addEventListener('submit', (e) => {
    e.preventDefault();
    const required = ['cep', 'logradouro', 'numero', 'bairro', 'cidade', 'uf', 'pais'];
    let ok = true;
    required.forEach(id => {
        const el = document.getElementById(id);
        if (!el.value || (id === 'cep' && apenasNumeros(el.value).length !== 8) || (id === 'uf' && el.value.length !== 2)) {
            el.focus();
            el.scrollIntoView({ behavior: 'smooth', block: 'center' });
            ok = false; return;
        }
    });
    if (!ok) return;
    // Aqui você pode fazer o submit real (fetch para seu back-end)
    const dados = Object.fromEntries(new FormData(form).entries());
    console.log('Endereço salvo:', dados);
    alert('Endereço salvo com sucesso!\n\n' + JSON.stringify(dados, null, 2));
    form.reset();
});