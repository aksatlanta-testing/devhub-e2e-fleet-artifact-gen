
{{- define "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.fullname" -}}
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


{{- define "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.labels" -}}
helm.sh/chart: {{ include "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.chart" . }}
{{ include "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95e816b6-20da-4dd6-b1e9-6a722d8f86af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}