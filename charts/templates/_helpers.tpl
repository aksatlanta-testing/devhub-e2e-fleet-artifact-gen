
{{- define "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.fullname" -}}
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


{{- define "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.labels" -}}
helm.sh/chart: {{ include "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.chart" . }}
{{ include "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc62a8c0f-5c78-477c-b410-34f18de7eb4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}