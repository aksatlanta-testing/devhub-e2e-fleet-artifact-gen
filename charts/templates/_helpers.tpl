
{{- define "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.fullname" -}}
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


{{- define "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.labels" -}}
helm.sh/chart: {{ include "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.chart" . }}
{{ include "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb5e2dd6-5b00-4b30-81b6-3c374ccb279d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}