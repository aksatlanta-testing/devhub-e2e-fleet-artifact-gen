
{{- define "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.fullname" -}}
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


{{- define "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.labels" -}}
helm.sh/chart: {{ include "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.chart" . }}
{{ include "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0178adeb-30a1-432b-b6a9-2358f1e2478c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}