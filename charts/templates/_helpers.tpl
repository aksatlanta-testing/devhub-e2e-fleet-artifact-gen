
{{- define "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.fullname" -}}
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


{{- define "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.labels" -}}
helm.sh/chart: {{ include "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.chart" . }}
{{ include "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8d438a6-d323-4e75-a31e-5b8071de9024.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}