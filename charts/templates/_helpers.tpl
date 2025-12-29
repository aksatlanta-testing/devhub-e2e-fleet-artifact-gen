
{{- define "go-echodb56395e-b506-4e9f-888c-b8be0147f469.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb56395e-b506-4e9f-888c-b8be0147f469.fullname" -}}
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


{{- define "go-echodb56395e-b506-4e9f-888c-b8be0147f469.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb56395e-b506-4e9f-888c-b8be0147f469.labels" -}}
helm.sh/chart: {{ include "go-echodb56395e-b506-4e9f-888c-b8be0147f469.chart" . }}
{{ include "go-echodb56395e-b506-4e9f-888c-b8be0147f469.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb56395e-b506-4e9f-888c-b8be0147f469.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb56395e-b506-4e9f-888c-b8be0147f469.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}