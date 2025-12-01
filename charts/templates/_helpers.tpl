
{{- define "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.fullname" -}}
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


{{- define "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.labels" -}}
helm.sh/chart: {{ include "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.chart" . }}
{{ include "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo78ca6832-bd7b-4bec-a861-ca29ed41619b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}