
{{- define "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.fullname" -}}
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


{{- define "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.labels" -}}
helm.sh/chart: {{ include "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.chart" . }}
{{ include "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod42d2a85-7f45-4cd2-a756-3bb48a0e4458.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}