
{{- define "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.fullname" -}}
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


{{- define "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.labels" -}}
helm.sh/chart: {{ include "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.chart" . }}
{{ include "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefea38a8-8c0d-4568-aad3-96f7a933b47f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}