
{{- define "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.fullname" -}}
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


{{- define "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.labels" -}}
helm.sh/chart: {{ include "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.chart" . }}
{{ include "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24dcdb20-a17e-49b6-956a-922db7a10cea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}