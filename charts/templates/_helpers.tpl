
{{- define "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.fullname" -}}
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


{{- define "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.labels" -}}
helm.sh/chart: {{ include "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.chart" . }}
{{ include "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo29e7d7d0-4d71-4c2e-a60e-a3495182da3f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}