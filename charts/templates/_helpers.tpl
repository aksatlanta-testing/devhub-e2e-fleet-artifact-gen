
{{- define "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.fullname" -}}
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


{{- define "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.labels" -}}
helm.sh/chart: {{ include "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.chart" . }}
{{ include "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12d527a4-179f-4927-8cd5-df06ec8789dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}