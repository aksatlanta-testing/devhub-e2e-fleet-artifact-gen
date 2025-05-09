
{{- define "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.fullname" -}}
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


{{- define "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.labels" -}}
helm.sh/chart: {{ include "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.chart" . }}
{{ include "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo237d62e8-d1f9-4b1e-b008-8153175f0dbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}