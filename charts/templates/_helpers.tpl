
{{- define "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.labels" -}}
helm.sh/chart: {{ include "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.chart" . }}
{{ include "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec25dae4-b53a-44e6-9e83-3c27ba77241e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}