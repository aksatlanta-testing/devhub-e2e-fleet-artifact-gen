
{{- define "go-echod0950dca-0769-4729-9801-614eea390078.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0950dca-0769-4729-9801-614eea390078.fullname" -}}
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


{{- define "go-echod0950dca-0769-4729-9801-614eea390078.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0950dca-0769-4729-9801-614eea390078.labels" -}}
helm.sh/chart: {{ include "go-echod0950dca-0769-4729-9801-614eea390078.chart" . }}
{{ include "go-echod0950dca-0769-4729-9801-614eea390078.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0950dca-0769-4729-9801-614eea390078.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0950dca-0769-4729-9801-614eea390078.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}