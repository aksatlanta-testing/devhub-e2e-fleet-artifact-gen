
{{- define "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.fullname" -}}
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


{{- define "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.labels" -}}
helm.sh/chart: {{ include "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.chart" . }}
{{ include "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01ea8021-a37e-4419-a85b-f0fa523ada0d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}