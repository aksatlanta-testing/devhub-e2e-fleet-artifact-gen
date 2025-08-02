
{{- define "go-echo69c86284-7101-4609-ac25-1bad650af4fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69c86284-7101-4609-ac25-1bad650af4fe.fullname" -}}
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


{{- define "go-echo69c86284-7101-4609-ac25-1bad650af4fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69c86284-7101-4609-ac25-1bad650af4fe.labels" -}}
helm.sh/chart: {{ include "go-echo69c86284-7101-4609-ac25-1bad650af4fe.chart" . }}
{{ include "go-echo69c86284-7101-4609-ac25-1bad650af4fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69c86284-7101-4609-ac25-1bad650af4fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69c86284-7101-4609-ac25-1bad650af4fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}