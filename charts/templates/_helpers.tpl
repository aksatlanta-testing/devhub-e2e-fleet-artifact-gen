
{{- define "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.fullname" -}}
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


{{- define "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.labels" -}}
helm.sh/chart: {{ include "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.chart" . }}
{{ include "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo17b2bc68-8af2-4acf-8df5-69c8bddfbafe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}